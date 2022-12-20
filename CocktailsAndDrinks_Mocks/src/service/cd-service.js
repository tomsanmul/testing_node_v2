
//Model desacoplado para mocking
const getAllCategories = async(Model) => await Model.allcategories();

const getCategory = Model => async(id) => await Model.category(id);

const getStock = async(Model) => await Model.stock();

module.exports = Model => {
    return {
        getAllCategories: getAllCategories(Model),
        getCategory: getCategory(Model),
        getStock: getStock(Model)
    }
}


