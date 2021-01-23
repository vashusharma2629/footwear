<?php

namespace App\Entity;

use App\Repository\FootwearCategoryRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=FootwearCategoryRepository::class)
 */
class FootwearCategory
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
    private $category_name;

    /**
     * @ORM\Column(type="text")
     */
    private $description;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="footwearCategories")
     * @ORM\JoinColumn(nullable=false)
     */
    private $managed_by;

    /**
     * @ORM\Column(type="datetime")
     */
    private $createdAt;

    
    /**
     * @ORM\Column(type="datetime")
     */
    private $updatedAt;

    /**
     * @ORM\OneToMany(targetEntity=FootwearProduct::class, mappedBy="category")
     */
    private $footwearProducts;

    public function __construct()
    {
        $this->footwearProducts = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCategoryName(): ?string
    {
        return $this->category_name;
    }

    public function setCategoryName(string $category_name): self
    {
        $this->category_name = $category_name;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getManagedBy(): ?User
    {
        return $this->managed_by;
    }

    public function setManagedBy(?User $managed_by): self
    {
        $this->managed_by = $managed_by;

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

    /**
     * @return Collection|FootwearProduct[]
     */
    public function getFootwearProducts(): Collection
    {
        return $this->footwearProducts;
    }

    public function addFootwearProduct(FootwearProduct $footwearProduct): self
    {
        if (!$this->footwearProducts->contains($footwearProduct)) {
            $this->footwearProducts[] = $footwearProduct;
            $footwearProduct->setCategory($this);
        }

        return $this;
    }

    public function removeFootwearProduct(FootwearProduct $footwearProduct): self
    {
        if ($this->footwearProducts->removeElement($footwearProduct)) {
            // set the owning side to null (unless already changed)
            if ($footwearProduct->getCategory() === $this) {
                $footwearProduct->setCategory(null);
            }
        }

        return $this;
    }

    public function __toString()
    {
        return $this->category_name;
        
    }
}
