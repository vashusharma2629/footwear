<?php
 namespace App\EventSubscriber;

 use App\Entity\FootwearProduct;

 use EasyCorp\Bundle\EasyAdminBundle\Event\BeforeEntityPersistedEvent;
 use EasyCorp\Bundle\EasyAdminBundle\Event\BeforeEntityUpdatedEvent;
 use Symfony\Component\EventDispatcher\EventSubscriberInterface;
 use Symfony\Component\Security\Core\Security;
 use Symfony\Component\String\Slugger\SluggerInterface;

 class ProductSubscriber implements EventSubscriberInterface {
     private $slugger;

     public function __construct(Security $security, SluggerInterface $slugger) {
         $this->slugger = $slugger;
         $this->security = $security;
     }

     public static function getSubscribedEvents(){
         return [
             BeforeEntityPersistedEvent::class => ['setFootwearProduct'],
             BeforeEntityUpdatedEvent::class => ['updateFootwearProduct'],
         ];
     }

     public function setFootwearProduct(BeforeEntityPersistedEvent $event){
         $entity = $event->getEntityInstance();
         if ($entity instanceof FootwearProduct) {
            
             $entity->setCreatedAt(new \DateTime());
             $entity->setUpdatedAt(new \DateTime());
             
            
             
         }
         
         return;
     }

     public function updateFootwearProduct(BeforeEntityUpdatedEvent $event){
         $entity = $event->getEntityInstance();
         if ($entity instanceof FootwearProduct) {
            
             $entity->setUpdatedAt(new \DateTime());
             
         }
         
         return;
     }
 }
 
 