<?php

namespace App\EventSubscriber;


use App\Entity\FootwearCategory;

use EasyCorp\Bundle\EasyAdminBundle\Event\AfterEntityPersistedEvent;
use EasyCorp\Bundle\EasyAdminBundle\Event\BeforeEntityPersistedEvent;
use EasyCorp\Bundle\EasyAdminBundle\Event\BeforeEntityUpdatedEvent;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\Security\Core\Security;

class EventSubscriber implements EventSubscriberInterface
{
    private $mailer;
    
    public function __construct(Security $security,MailerInterface $mailer)
    {
        $this->security = $security;
        $this->mailer = $mailer;
    } 

    public function sendMail(AfterEntityPersistedEvent $event)
    {
        $entity = $event->getEntityInstance();
        if ($entity instanceof FootwearCategory){
            $cat_name=$entity->getCategoryName();
            $cat_Managed_by=(string) $entity->getManagedBy();
            $email = (new Email())
            ->from('vashusharma2625@gmail.com')
            ->to($cat_Managed_by)
            ->subject('A new Category has been Added')
            ->text(' You are Assigned to '.$cat_name.' category Wishing You all the Best Please reply with a confirmation mail')
            ->html('<p>You are Assigned to <b>'.$cat_name.'<b> Category</p>');
            $this->mailer->send($email);  
          } 
    }

    public static function getSubscribedEvents()
    {
        return [
            AfterEntityPersistedEvent::class=>['sendMail'],
            BeforeEntityPersistedEvent::class => ['setFootwearCategory'],
            BeforeEntityUpdatedEvent::class => ['updateFootwearCategory'],
            
        ];
    }
    public function setFootwearCategory(BeforeEntityPersistedEvent $event){
        $entity = $event->getEntityInstance();
        if ($entity instanceof FootwearCategory) {
           
            $entity->setCreatedAt(new \DateTime());
            $entity->setUpdatedAt(new \DateTime());
            
        }
        
        return;
    }

    public function updateFootwearCategory(BeforeEntityUpdatedEvent $event){
        $entity = $event->getEntityInstance();
        if ($entity instanceof FootwearCategory) {
           
            $entity->setUpdatedAt(new \DateTime());
        }
        
        return;
    }
   
}