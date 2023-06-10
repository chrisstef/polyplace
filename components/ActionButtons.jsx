import React from 'react'
import { BiRefresh, BiLinkExternal, BiCopy } from 'react-icons/bi'
import { MdMoreVert } from 'react-icons/md'

const ActionButtons = () => {

    const actionItems = [
        {
            icon: <BiRefresh className='h-6 w-6 text-gray-500 dark:text-gray-400' />,
            name: "Refresh"
        },
        {
            icon: <BiLinkExternal className='h-6 w-6 text-gray-500 dark:text-gray-400' />,
            name: "External"
        },
        {
            icon: <BiCopy className='h-6 w-6 text-gray-500 dark:text-gray-400' />,
            name: "Copy"
        },
        {
            icon: <MdMoreVert className='h-6 w-6 text-gray-500 dark:text-gray-400' />,
            name: "More"
        }
    ]

    return (
        <div className='relative flex divide-x divide-gray-300 rounded-lg border border-gray-300 shadow-sm cursor-pointer'>
            {actionItems.map((item, index) => (
                <div key={item.name} className='action-icon group'>
                    {item.icon}
                    <span className='action-tooltip group-hover:scale-100'>
                        {item.name}
                    </span>
                </div>
            ))}
        </div>
    )
}

export default ActionButtons
