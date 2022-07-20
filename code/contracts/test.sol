contract dasp10 {
    int256 internal result;
    address private owner;

    constructor (){
        owner = msg.sender;
    }

    function add(int256 num1, int256 num2) public {
        require(owner == msg.sender,"You are not the owner");
        _add(num1, num2);
    }

    function _add(int256 num1, int256 num2) internal {
        result = num1 + num2;
    }

    function getResult() public view returns(int256){
        return result;
    }

    function getResultPure(int256 num1, int256 num2) public pure returns(int256){
        return num1 + num2;
    }
}