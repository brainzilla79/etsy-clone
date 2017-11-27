import { connect } from "react-redux";
import ProductIndex from "./product_index";
import {
  getAllProducts,
  getSearchProducts,
  getFeaturedProducts,
  getProductsByCategory,
  getProductsBySeller
} from "../../actions/product_actions";

const mapStateToProps = state => ({
  products: Object.values(state.products)
});

const mapDispatchToProps = () => dispatch => ({
  getSearchProducts: searchTerm => dispatch(getSearchProducts(searchTerm)),
  getFeaturedProducts: () => dispatch(getFeaturedProducts()),
  getProductsByCategory: categoryId => dispatch(getProductsByCategory(categoryId)),
  getProductsBySeller: userId => dispatch(getProductsBySeller(userId))
});

export default connect(mapStateToProps, mapDispatchToProps)(ProductIndex);
