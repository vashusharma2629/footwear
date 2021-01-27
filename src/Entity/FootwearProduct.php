<?php

namespace App\Entity;

use App\Repository\FootwearProductRepository;
use Doctrine\ORM\Mapping as ORM;
use App\Controller\Admin\HttpFoundationResponse;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * @ORM\Entity(repositoryClass=FootwearProductRepository::class)
 */
class FootwearProduct
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $footwear_type;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $colour;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $brand;

    

    /**
     * @ORM\Column(type="integer")
     */
    private $size;

    /** 
    *@ORM\Column(type="string", columnDefinition="ENUM('male', 'female' , 'kids')")
    */
    private $section;

     /** 
    *@ORM\Column(type="string", columnDefinition="ENUM('HIGH', 'MEDIUM' , 'LOW')")
    */
    private $durability;

     /** 
    *@ORM\Column(type="string", columnDefinition="ENUM('EASY', 'MEDIUM' , 'DIFFICULT')")
    */
    private $ease_to_wear;

     /** 
    *@ORM\Column(type="string", columnDefinition="ENUM('','RUBBER', 'CAMP' , 'CORK')")
    */
    private $sole_type;

     /** 
    *@ORM\Column(type="string", columnDefinition="ENUM('','COTTON', 'NYLON' , 'ELASTIC')")
    */
    private $lace_type;

    
    /**
     * @ORM\Column(type="string", length=255)
     */
    private $product_image;

    /**
     * @ORM\ManyToOne(targetEntity=FootwearCategory::class, inversedBy="footwearProducts")
     * @ORM\JoinColumn(nullable=false)
     */
    private $category;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="footwearProducts")
     * @ORM\JoinColumn(nullable=false)
     */
    private $manager;

    /**
     * @ORM\Column(type="datetime")
     */
    private $createdAt;

    /**
     * @ORM\Column(type="datetime")
     */
    private $updatedAt;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $material;

    /**
     * @ORM\Column(type="text")
     */
    private $short_description;

    /** 
    *@ORM\Column(type="string", columnDefinition="ENUM('NEW', 'REVIEW' , 'PUBLISHED')")
    */
    private $status;

    /**
     * @ORM\Column(type="text")
     */
    private $detailed_description;

    /**
     * @ORM\Column(type="integer")
     */
    private $quantity_in_stock;

    /**
     * @ORM\Column(type="float" ,nullable=true)
     */
    private $market_price;

    /**
     * @ORM\Column(type="float" ,nullable=true)
     */
    private $discount;

    /**
     * @ORM\Column(type="float")
     */
    private $selling_price;

    /**
     * @ORM\Column(type="float")
     */
    private $weight;

     /** 
    *@ORM\Column(type="string", columnDefinition="ENUM('PARTY WEAR', 'CASUAL WEAR' , 'OFFICE WEAR')")
    */
    private $occasion;

     /** 
    *@ORM\Column(type="string", columnDefinition="ENUM('INDIA', 'AMERICA' , 'GEORGIA', 'OTHERS')")
    */
    private $made_in;

     /** 
    *@ORM\Column(type="string", columnDefinition="ENUM('3 STAR', '4 STAR' , '5 STAR')")
    */
    private $rating;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $attribute1;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFootwearType(): ?string
    {
        return $this->footwear_type;
    }

    public function setFootwearType(string $footwear_type): self
    {
        $this->footwear_type = $footwear_type;

        return $this;
    }

    public function getColour(): ?string
    {
        return $this->colour;
    }

    public function setColour(string $colour): self
    {
        $this->colour = $colour;

        return $this;
    }

    public function getBrand(): ?string
    {
        return $this->brand;
    }

    public function setBrand(string $brand): self
    {
        $this->brand = $brand;

        return $this;
    }

    
    public function getSize(): ?int
    {
        return $this->size;
    }

    public function setSize(int $size): self
    {
        $this->size = $size;

        return $this;
    }

    

    public function getProductImage(): ?string
    {
        return $this->product_image;
    }

    public function setProductImage(string $product_image): self
    {
        $this->product_image = $product_image;

        return $this;
    }

    public function getCategory(): ?FootwearCategory
    {
        return $this->category;
    }

    public function setCategory(?FootwearCategory $category): self
    {
        $this->category = $category;

        return $this;
    }

    public function getManager(): ?User
    {
        return $this->manager;
    }

    public function setManager(?User $manager): self
    {
        $this->manager = $manager;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeInterface $createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(\DateTimeInterface $updatedAt): self
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    public function getSection(): ?string
    {
        return $this->section;
    }

    public function setSection(string $section): self
    {
        $this->section = $section;

        return $this;
    }

    
    // public function __toString()
    // {
    //     $this->category_name;
        
    // }

    public function getMaterial(): ?string
    {
        return $this->material;
    }

    public function setMaterial(string $material): self
    {
        $this->material = $material;

        return $this;
    }

    public function getShortDescription(): ?string
    {
        return $this->short_description;
    }

    public function setShortDescription(string $short_description): self
    {
        $this->short_description = $short_description;

        return $this;
    }

    public function getDetailedDescription(): ?string
    {
        return $this->detailed_description;
    }

    public function setDetailedDescription(string $detailed_description): self
    {
        $this->detailed_description = $detailed_description;

        return $this;
    }

    public function getQuantityInStock(): ?int
    {
        return $this->quantity_in_stock;
    }

    public function setQuantityInStock(int $quantity_in_stock): self
    {
        $this->quantity_in_stock = $quantity_in_stock;

        return $this;
    }

    public function getMarketPrice(): ?float
    {
        return $this->market_price;
    }

    public function setMarketPrice(float $market_price): self
    {
        $this->market_price = $market_price;

        return $this;
    }

    public function getDiscount(): ?float
    {
        return $this->discount;
    }

    public function setDiscount(float $discount): self
    {
        $this->discount = $discount;

        return $this;
    }

    public function getSellingPrice(): ?float
    {
        return $this->selling_price;
    }

    public function setSellingPrice(float $selling_price): self
    {
        $this->selling_price = $selling_price;

        return $this;
    }

    public function getWeight(): ?float
    {
        return $this->weight;
    }

    public function setWeight(float $weight): self
    {
        $this->weight = $weight;

        return $this;
    }

    public function getAttribute1(): ?string
    {
        return $this->attribute1;
    }

    public function setAttribute1(?string $attribute1): self
    {
        $this->attribute1 = $attribute1;

        return $this;
    }

    public function getDurability(): ?string
    {
        return $this->durability;
    }

    public function setDurability(string $durability): self
    {
        $this->durability = $durability;

        return $this;
    }

    public function getEaseToWear(): ?string
    {
        return $this->ease_to_wear;
    }

    public function setEaseToWear(string $ease_to_wear): self
    {
        $this->ease_to_wear = $ease_to_wear;

        return $this;
    }

    

    

    public function getOccasion(): ?string
    {
        return $this->occasion;
    }

    public function setOccasion(string $occasion): self
    {
        $this->occasion = $occasion;

        return $this;
    }

    

    public function getRating(): ?string
    {
        return $this->rating;
    }

    public function setRating(string $rating): self
    {
        $this->rating = $rating;

        return $this;
    }

    public function getSoleType(): ?string
    {
        return $this->sole_type;
    }

    public function setSoleType(string $sole_type): self
    {
        $this->sole_type = $sole_type;

        return $this;
    }

    public function getLaceType(): ?string
    {
        return $this->lace_type;
    }

    public function setLaceType(string $lace_type): self
    {
        $this->lace_type = $lace_type;

        return $this;
    }

    public function getMadeIn(): ?string
    {
        return $this->made_in;
    }

    public function setMadeIn(string $made_in): self
    {
        $this->made_in = $made_in;

        return $this;
    }

    public function getStatus(): ?string
    {
        return $this->status;
    }

    public function setStatus(string $status): self
    {
        $this->status = $status;

        return $this;
    }

    public function toArray()          
        {
            
            return [
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
   
    
    
}
