import { useContext } from 'react'
import AuthContext from '../hooks/AuthContext';



const useAuth = () => {
    return useContext(AuthContext) 
}
export default useAuth;
