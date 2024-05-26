import React from 'react'
import { Navigate, Outlet } from 'react-router-dom'

export default function ProtectedRoute({ user, redirectTo = "/" }) {
    if (!user?.admin==1) {
        return <Navigate to={redirectTo} />
    }

    return <Outlet />
}
