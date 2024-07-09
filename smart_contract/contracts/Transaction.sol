// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract Transaction {
    uint256 transactionCount;

    struct transactionStruct {
        address sender;
        address reciever;
        uint amount;
        string message;
        uint256 timestamp;
    }

    transactionStruct[] transactions;

    event Transfer(
        address sender,
        address payable reciever,
        uint amount,
        string message,
        uint256 timestamp
    );

    function addToBlockchain(
        address payable reciever,
        uint amount,
        string memory message
    ) public {
        transactionCount += 1;
        transactions.push(
            transactionStruct(
                msg.sender,
                reciever,
                amount,
                message,
                block.timestamp
            )
        );

        emit Transfer(msg.sender, reciever, amount, message, block.timestamp);
    }

    function getAllTransactions()
        public
        view
        returns (transactionStruct[] memory)
    {
        return transactions;
    }

    function getTransactionCount() public view returns (uint256) {
        return transactionCount;
    }
}
