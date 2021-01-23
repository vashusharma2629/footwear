<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210119165339 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE footwear_category (id INT AUTO_INCREMENT NOT NULL, managed_by_id INT NOT NULL, category_name VARCHAR(255) NOT NULL, description LONGTEXT NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX IDX_95F574B0873649CA (managed_by_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE footwear_product (id INT AUTO_INCREMENT NOT NULL, category_id INT NOT NULL, manager_id INT NOT NULL, footwear_type VARCHAR(255) NOT NULL, colour VARCHAR(255) NOT NULL, brand VARCHAR(255) NOT NULL, price DOUBLE PRECISION NOT NULL, size INT NOT NULL, gender VARCHAR(255) NOT NULL, product_image VARCHAR(255) NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX IDX_63D8E82012469DE2 (category_id), INDEX IDX_63D8E820783E3463 (manager_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE footwear_category ADD CONSTRAINT FK_95F574B0873649CA FOREIGN KEY (managed_by_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE footwear_product ADD CONSTRAINT FK_63D8E82012469DE2 FOREIGN KEY (category_id) REFERENCES footwear_category (id)');
        $this->addSql('ALTER TABLE footwear_product ADD CONSTRAINT FK_63D8E820783E3463 FOREIGN KEY (manager_id) REFERENCES `user` (id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE footwear_product DROP FOREIGN KEY FK_63D8E82012469DE2');
        $this->addSql('DROP TABLE footwear_category');
        $this->addSql('DROP TABLE footwear_product');
    }
}