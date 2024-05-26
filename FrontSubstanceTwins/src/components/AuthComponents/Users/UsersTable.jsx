import React from 'react'

export default function UsersTable({users, deleteUser}) {

    const showAlert = ({ user }) => {
        const { id } = user;
        swal({
            title: "Are you sure?",
            text: "Once deleted, you will not be able to recover this user!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
        .then((willDelete) => {
            if (willDelete) {
                deleteUser(id)
                    .then(() => {
                        swal("Poof! The user has been deleted!", {
                            icon: "success",
                        });
                    })
                    .catch(error => {
                        swal("Error!", "An error occurred while deleting the user.", "error");
                        console.error("Error deleting product:", error);
                    });
            } 
        });
    }


  return (
    <>
    <table className='table table-light'>
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Admin</th>
                <th scope='col'>Action</th>
            </tr>
        </thead>
        <tbody>
            {users.map(user => (
                <tr key={user.id}>
                    <td>{user.id}</td>
                    <td>{user.name}</td>
                    <td>{user.email}</td>
                    <td>
                        {user.admin=== 0 ? 'Client' :
                            user.admin === 1 ? 'Admin' : 
                                    'Unknown'}
                    </td>
                    <td>
                            <button className='btn btn-danger' onClick={() => showAlert({ user })}>
                                Delete
                            </button>
        
                    </td>
                </tr>
            ))}
        </tbody>
    </table>
</>  )
}
