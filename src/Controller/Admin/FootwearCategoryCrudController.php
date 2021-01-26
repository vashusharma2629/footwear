<?php

namespace App\Controller\Admin;

use App\Entity\FootwearCategory;
use App\Entity\FootwearProduct;
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

class FootwearCategoryCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return FootwearCategory::class;
    }
    public function configureCrud(Crud $crud): Crud{
    if ($this->isGranted('ROLE_ADMIN') || $this->isGranted('ROLE_MANAGER')) {
    
        return $crud
           
            
            
        ;
    }
    }
    public function configureActions(Actions $actions): Actions
    {

        return $actions
             ->disable(Action::DELETE)
             //->setPermission(Action::DELETE, 'ROLE_ADMIN')
             ->setPermission(Action::EDIT, 'ROLE_ADMIN')
             ->setPermission(Action::NEW, 'ROLE_ADMIN');
             
    }
    
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            AssociationField::new('managed_by'),
            TextField::new('category_name'),
            TextEditorField::new('description'),
            DateTimeField::new('createdAt')->hideOnIndex()->hideOnForm(),
            DateTimeField::new('updatedAt')->hideOnIndex()->hideOnForm(),
        ];
    }
    
}
