// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedArraySum {
    // Do not modify this
    uint256[] array;

    // Do not modify this
    function setArray(uint256[] memory _array) external {
        require(_array.length <= 10, 'too long');
        array = _array;
    }

    // optimize this function
    function getArraySum() external view returns (uint256 sum) { //? Declaring variable here to optimize gas
        for (uint256 i = 0; i < array.length; i++) {
            sum += array[i];
        }  
    }
}
