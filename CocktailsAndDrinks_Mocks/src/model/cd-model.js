const { PrismaClient}  = require('@prisma/client');
const prisma = new PrismaClient();

const allcategories = async() => await prisma.tipos_vinos.findMany();
const category = async(idCategory) => await prisma.tipos_vinos.findUnique({
    where: {
        ID_VINO: parseInt(idCategory)
    }
});
const stock = async() => await prisma.productos.findMany();

module.exports = {
    allcategories,
    category,
    stock
}