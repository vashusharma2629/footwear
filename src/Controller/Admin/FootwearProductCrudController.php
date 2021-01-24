<?php

namespace App\Controller\Admin;


use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\FootwearProduct;
use App\Entity\FootwearCategory;
use App\Repository\FootwearProductRepository;
use App\Repository\FootwearCategoryRepository;
use App\Repository\UserRepository;
use App\Form\FootwearProductType;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\CollectionField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Psr\Log\LoggerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\HeaderUtils;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Component\Validator\Constraints\Choice;

class FootwearProductCrudController extends AbstractCrudController
{
    public function __construct(
        AdminUrlGenerator $adminUrlGenerator, 
        FootwearCategoryRepository $FootwearCategoryRepository, 
        UserRepository $UserRepository, 
        FootwearProductRepository $FootwearProductRepository, 
        SluggerInterface $slugger,
        LoggerInterface $logger
    ) {
        $this->adminUrlGenerator = $adminUrlGenerator;
        $this->FootwearCategoryRepository = $FootwearCategoryRepository;
        $this->UserRepository = $UserRepository;
        $this->FootwearProductRepository = $FootwearProductRepository;
        $this->slugger = $slugger;
        $this->logger = $logger;
    }

    public static function getEntityFqcn(): string
    {
        return  FootwearProduct::class;
    }
    public function configureActions(Actions $actions): Actions

    {
        $importPostButton = Action::new('importPost', 'Import')->setCssClass('btn btn-default')->createAsGlobalAction()->linkToCrudAction('importPost');
        
         
        
         
        if ($this->isGranted('ROLE_ADMIN') || $this->isGranted('ROLE_MANAGER')) {
    
            return $actions 
            ->add(Crud::PAGE_INDEX, $importPostButton)
            ->add(Crud::PAGE_INDEX, 'detail')
            
            
           
            
            ;
        }
        else{
            return $actions
            ->setPermission(Action::DELETE, 'ROLE_ADMIN')
             ->setPermission(Action::EDIT, 'ROLE_ADMIN')
             ->setPermission(Action::NEW, 'ROLE_ADMIN')
             ->add(Crud::PAGE_INDEX, 'detail')
             
            ;
        }
       
                     
    }

    
    public function configureFields(string $pageName): iterable
    {
        $uploadPath = $this->getParameter('images');
        return [
            IdField::new('id')->hideOnForm()->hideOnIndex(),
            AssociationField::new('category'),
            AssociationField::new('manager'),
            TextField::new('footwear_type'),
            TextField::new('colour'),
            TextField::new('brand'),
            integerField::new('size'),
            ImageField::new('product_image')->setLabel('Image')->setBasePath($uploadPath['uploads']['url_prefix'])->setUploadDir($uploadPath['uploads']['url_path'])->setRequired(false),
            DateTimeField::new('createdAt')->hideOnIndex()->hideOnForm(),
            DateTimeField::new('updatedAt')->hideOnIndex()->hideOnForm(),
            ChoiceField::new('section')->setChoices([
                
                 'male' => 'male',
                 'female' => 'female',
                 'kids' => 'kids',
                 
             ]),
            ChoiceField::new('durability')->setChoices([
                
                'HIGH' => 'HIGH',
                'MEDIUM' => 'MEDIUM',
                'LOW' => 'LOW',
                
            ]),
            ChoiceField::new('ease_to_wear')->setChoices([
                
                'EASY' => 'EASY',
                'MEDIUM' => 'MEDIUM',
                'DIFFICULT' => 'DIFFICULT',
                
            ]),
            ChoiceField::new('sole_type')->setChoices([
                'NONE' => ' ',
                'RUBBER' => 'RUBBER',
                'CAMP' => 'CAMP',
                'CORK' => 'CORK',
                
            ]),
            ChoiceField::new('lace_type')->setChoices([
                'NONE' => ' ',
                'COTTON' => 'COTTON',
                'NYLON' => 'NYLON',
                'ELASTIC' => 'ELASTIC',
                
            ]),
            TextField::new('material'),
            TextEditorField::new('short_description'),
            TextEditorField::new('detailed_description'),
            integerField::new('quantity_in_stock'),
            integerField::new('market_price'),
            integerField::new('discount'),
            integerField::new('selling_price'),
            integerField::new('weight'),
            ChoiceField::new('occasion')->setChoices([
                
                'PARTY WEAR' => 'PARTY WEAR',
                'CASUAL WEAR' => 'CASUAL WEAR',
                'OFFICE WEAR' => 'OFFICE WEAR',
                
            ]),
            ChoiceField::new('made_in')->setChoices([
                
                'INDIA' => 'INDIA',
                'AMERICA' => 'AMERICA',
                'GEORGIA' => 'GEORGIA',
                'OTHERS'  => 'OTHERS',
                
            ]),
            ChoiceField::new('rating')->setChoices([
                
                '3 STAR' => '3 STAR',
                '4 STAR' => '4 STAR',
                '5 STAR' => '5 STAR',
                
            ]),
            TextField::new('attribute1'),

            ChoiceField::new('status')->setChoices([
                
                'NEW' => 'NEW',
                'REVIEW' => 'REVIEW',
                'PUBLISHED' => 'PUBLISHED',
                
            ]),

            

            
        ];
    }
    public function importPost(Request $request)
    {
        $post = new FootwearProduct();
        $form = $this->createForm(FootwearProductType::class, $post);        
        $form->handleRequest($request);

        $importedFile = $form->get('import_file')->getData();
        if ($form->isSubmitted() && $importedFile) {
            $jsonData = file_get_contents($importedFile);
            $entityManager = $this->getDoctrine()->getManager();
           
            try{
                $postData = json_decode($jsonData);
               
                foreach ($postData as $postItem) {
                    $newPost = new FootwearProduct();
                    $cat= $this->FootwearCategoryRepository->find($postItem->category_id);
                    $cat1= $this->UserRepository->find($postItem->manager_id);
                    $newPost->setFootwearType($postItem->footwear_type);
                    $newPost->setColour($postItem->colour);
                    $newPost->setBrand($postItem->brand);
                    $url = $postItem->product_image; 
                    $fname=basename($postItem->product_image); $img = 'uploads/images/'.$fname.''; file_put_contents($img, file_get_contents($url)); $newPost->setProductImage($fname);
                    $newPost->setSection($postItem->section);
                    $newPost->setSize($postItem->size);

                    if(!empty($cat)){
                        $newPost->setCategory($cat);
                    }
                    if(!empty($cat1)){
                        $newPost->setManager($cat1);
                    }
                    $newPost->setCreatedAt(new \DateTime());
                    $newPost->setUpdatedAt(new \DateTime());
                    
                    $newPost->setDurability($postItem->durability);
                    $newPost->setEaseToWear($postItem->ease_to_wear);
                    $newPost->setSoleType($postItem->sole_type);
                    $newPost->setLaceType($postItem->lace_type);
                    $newPost->setMaterial($postItem->material);
                    $newPost->setShortDescription($postItem->short_description);
                    $newPost->setDetailedDescription($postItem->detailed_description);
                    $newPost->setQuantityInStock($postItem->quantity_in_stock);
                    $newPost->setMarketPrice($postItem->market_price);
                    $newPost->setDiscount($postItem->discount);
                    $newPost->setSellingPrice($postItem->selling_price);
                    $newPost->setWeight($postItem->weight);
                    $newPost->setOccasion($postItem->occasion);
                    $newPost->setMadeIn($postItem->made_in);
                    $newPost->setRating($postItem->rating);
                    $newPost->setAttribute1($postItem->attribute1);
                    $newPost->setStatus('NEW');

                    $entityManager->persist($newPost);
                    $entityManager->flush();
                }

                $this->addFlash('success', 'Product(s) data has been imported successfully');
                $this->logger->info('Data imported', $postData);
            } catch (\Exception $e){
                $this->addFlash('error', 'Unable to import data correctly.');
                $this->logger->error('Unable to import data correctly.');
            }
        }else{
            $this->logger->error('File was not uploaded');
        }

        return $this->render('admin/product/import.html.twig', [
            'page_title' => 'Import Product',
            'back_link' => $this->adminUrlGenerator->setController(FootwearProductCrudController::class)->setAction(Action::INDEX)->generateUrl(),
            'form' => $form->createView()
        ]);
    }
/**
 * @Route("/api_footwear_product", name="get_all_Product", methods={"GET"})
 */
public function getAll(): JsonResponse
{
    $Product = $this->FootwearProductRepository->FindBy([
        'status' => 'PUBLISHED'
   ]);
    $data = [];

    foreach ($Product as $Products) {
        $data[] = [
                'id' => $Products->getId(),
                'footwear_type' => $Products->getFootwearType(),
                'colour' => $Products->getColour(),
                'brand' => $Products->getBrand(),
                'product_image' => $Products->getProductImage(),
                'section' => $Products->getSection(),
                'size' => $Products->getSize(),
                'created_at' => $Products->getCreatedAt(),
                'updated_at' => $Products->getUpdatedAt(),
                'durability' => $Products->getDurability(),
                'ease_to_wear' => $Products->getEaseToWear(),
                'sole_type' => $Products->getSoleType(),
                'lace_type' => $Products->getLaceType(),
                'material' => $Products->getMaterial(),
                'short_description' => $Products->getShortDescription(),
                'detailed_description' => $Products->getDetailedDescription(),
                'quantity_in_stock' => $Products->getQuantityInStock(),
                'market_price' => $Products->getMarketPrice(),
                'discount' => $Products->getDiscount(),
                'selling_price' => $Products->getSellingPrice(),
                'weight' => $Products->getWeight(),
                'occasion' => $Products->getOccasion(),
                'made_in' => $Products->getMadeIn(),
                'rating' => $Products->getRating(),
                'attribute1' => $Products->getAttribute1(),
                'status' => $Products->getStatus()
        ];
    }

    return new JsonResponse($data);
}
	

}
 

    
    

