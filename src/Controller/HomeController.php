<?php

namespace App\Controller;
use App\Entity\FootwearProduct;
use App\Repository\FootwearProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function index(FootwearProductRepository $footwearproductRepository): Response
    {
        // $this->getDoctrine()->getManager()->getConfiguration()->getMetadataDriverImpl()->getAllClassNames();
        $products = $footwearproductRepository->findBy([
             'status' => 'PUBLISHED'
        ]);
        return $this->render('home/index.html.twig', [
            'products' => $products
        ]);
    }

     /**
     * @Route("/product/{id}", name="show_product")
     */
    public function show_product($id, Request $request, FootwearProductRepository $footwearproductRepository): Response
    {
         $product=$footwearproductRepository->find($id);
        return $this->render('home/index1.html.twig', [
            'product' => $product
        ]);
    }
}

