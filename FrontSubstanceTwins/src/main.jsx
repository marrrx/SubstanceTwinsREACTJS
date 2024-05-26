import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx'
import './index.css'
import { ErrorProvider } from './contexts/Errors/ErrorsContext.jsx'
import { AuthProvider } from './contexts/Auth/hooks/AuthContext.jsx'
import { ProductProvider } from './contexts/Products&Categories/hook/ProductsContext.jsx'

ReactDOM.createRoot(document.getElementById('root')).render(

  <React.StrictMode>
    <ErrorProvider>
      <AuthProvider>
        <ProductProvider>
          <App />
        </ProductProvider>
      </AuthProvider>
    </ErrorProvider>
  </React.StrictMode>

)
