<?php

namespace App\Controller\Admin;

use EasyCorp\Bundle\EasyAdminBundle\EventSubscriber\ExceptionListener;

use App\Entity\FootwearCategory;
use App\Entity\FootwearProduct;
use App\Entity\Review;
use App\Entity\user;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use EasyCorp\Bundle\EasyAdminBundle\Router\CrudUrlGenerator;

class AdminDashboardController extends AbstractDashboardController
{
    /**
     * @Route("/admin", name="admin")
     */
    public function index(): Response
    {
        $routerBuilder=$this->get(CrudUrlGenerator::class)->build();
        return $this->redirect($routerBuilder->setController
        (UserCrudController::class)->generateUrl());
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Footwear');
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linktoDashboard('User-Inormation', 'fa fa-users')->setPermission('ROLE_ADMIN');
       
        if ($this->isGranted('ROLE_ADMIN') || $this->isGranted('ROLE_MANAGER')) {
            yield MenuItem::linkToCrud('FootwearCategory', 'fa fa-pie-chart', FootwearCategory::class);
            yield MenuItem::linkToCrud('FootwearProduct', 'fa fa-shopping-bag', FootwearProduct::class);
            
        }
    
       
        
       
        
        
    }
}
