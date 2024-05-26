
import './App.css'
import { BrowserRouter, Routes, Route } from 'react-router-dom'
import Index from './views/Index'
import Dashboard from './views/Dashboard'
import Login from './views/Login'
import Register from './views/Register'
import ProtectedRoute from './components/ProtectedRoute'
import useAuth from './contexts/Auth/context/useAuth'
import Products from './views/Products'
import Orders from './views/Orders'
import Users from './views/Users'

function App() {

  const {user, accessToken, isAuthenticated, deleteUser} = useAuth();

  return (
    <BrowserRouter>
      <Routes>
        <Route path='/' element={<Index/>} />
        <Route path='/login' element={<Login />} />
        <Route path='/register' element={<Register />} />

        <Route element={<ProtectedRoute user={user} />}>
          <Route path='/dashboard' element={<Dashboard isAuthenticated={isAuthenticated} user={user}/>} />
          <Route path='/products' element={<Products isAuthenticated={isAuthenticated} user={user}/>} />
          <Route path='/orders' element={<Orders isAuthenticated={isAuthenticated} user={user}/>} />
          <Route path='/users' element={<Users isAuthenticated={isAuthenticated} user={user} accessToken={accessToken} deleteUser={deleteUser}/>} />
        </Route>

        
      </Routes>
    </BrowserRouter>
  )
}

export default App
