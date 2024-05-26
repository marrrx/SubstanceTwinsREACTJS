import React from 'react'

export default function OrdersTable({orders,makeStatusCompleted,makeStatusShipped,deleteOrder}) {
    return (
        <>
            <table className='table table-light'>
                <thead>
                    <tr>
                        <th scope="col">Order</th>
                        <th scope="col">User</th>
                        <th scope="col">Products</th>
                        <th scope="col">Total</th>
                        <th scope="col">Status</th>
                        <th scope="col">Change status</th>

                    </tr>
                </thead>
                <tbody>
                    {orders.map(order => (
                        <tr key={order.id}>
                            <td>{order.id}</td>
                            <td>{order.user.name}</td>
                            <td>
                                <ul>
                                    {order.products.map(product => (
                                        <li key={product.id}>
                                            {product.name} - Quantity: {product.pivot.quantity}
                                        </li>
                                    ))}
                                </ul>
                            </td>
                            <td>{order.total}</td>
                            <td>
                                {order.order_statuses_id === 1 ? 'Process' :
                                    order.order_statuses_id === 2 ? 'Shipped' :
                                        order.order_statuses_id === 3 ? 'Completed' :
                                            'Unknown'}
                            </td>
                            <td>
                                {order.order_statuses_id === 1 && (
                                    <button className='btn btn-warning' onClick={()=>makeStatusShipped(order.id)}>
                                        Shipped
                                    </button>
                                )}
                                {order.order_statuses_id === 2 && (
                                    <button className='btn btn-success' onClick={()=>makeStatusCompleted(order.id)}>
                                        Completed
                                    </button>
                                )}
                                {order.order_statuses_id === 3 && (
                                    <button className='btn btn-danger' onClick={()=>deleteOrder(order.id)}>
                                        Delete
                                    </button>
                                )}
                                {order.order_statuses_id === null && (
                                    <></>
                                )}
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </>
    )
}
