export default function Alert({ children }) {
    return (
        <div className="alert alert-danger" role="alert">
            {children}
        </div>
    )
}
