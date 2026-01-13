/*
  Warnings:

  - The primary key for the `CommissionRate` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `CommissionRate` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Member` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Member` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Position` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Position` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `client` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `client` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `positionId` on the `CommissionRate` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `positionId` on the `Member` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "CommissionRate" DROP CONSTRAINT "CommissionRate_positionId_fkey";

-- DropForeignKey
ALTER TABLE "Member" DROP CONSTRAINT "Member_positionId_fkey";

-- AlterTable
ALTER TABLE "CommissionRate" DROP CONSTRAINT "CommissionRate_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "positionId",
ADD COLUMN     "positionId" INTEGER NOT NULL,
ADD CONSTRAINT "CommissionRate_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Member" DROP CONSTRAINT "Member_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "positionId",
ADD COLUMN     "positionId" INTEGER NOT NULL,
ADD CONSTRAINT "Member_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Position" DROP CONSTRAINT "Position_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Position_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "client" DROP CONSTRAINT "client_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "client_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE UNIQUE INDEX "CommissionRate_positionId_key" ON "CommissionRate"("positionId");

-- AddForeignKey
ALTER TABLE "CommissionRate" ADD CONSTRAINT "CommissionRate_positionId_fkey" FOREIGN KEY ("positionId") REFERENCES "Position"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Member" ADD CONSTRAINT "Member_positionId_fkey" FOREIGN KEY ("positionId") REFERENCES "Position"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
