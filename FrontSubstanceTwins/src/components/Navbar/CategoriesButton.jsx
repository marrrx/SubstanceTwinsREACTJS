import useProduct from "../../contexts/Products&Categories/context/useProduct"


export default function CategoriesButton({ category }) {
  
  const{handleClickCategory}= useProduct();

    const { id, name } = category
    
  return (
    <li className="nav-item">
      <button 
      className="nav-link"
      type="button"
      onClick={()=>handleClickCategory(id)}
      data-bs-dismiss="offcanvas">
        {name}
      </button>
    </li>

  )
}
