import { useContext } from 'react'
import ProductContext from '../hook/ProductsContext.jsx';

 const useProduct = () => {
    return useContext(ProductContext) 
}
export default useProduct;
