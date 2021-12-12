// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.10;
import"./SimpleToken.sol";

contract Lock is OwnerHelper{
    function isTokenLock(address from, address to) public view returns (bool lock) {
        lock = false;

        if(_tokenLock == true)
        {
             lock = true;
        }

        if(_personalTokenLock[from] == true || _personalTokenLock[to] == true) {
             lock = true;
        }
    }

    function removeTokenLock() onlyOwner public {
        require(_tokenLock == true);
        _tokenLock = false;
    }
    
    function TokenLockUp() onlyOwner public{
        require(_tokenLock == false);
        _tokenLock = true;
    }

    function removePersonalTokenLock(address _who) onlyOwner public {
        require(_personalTokenLock[_who] == true);
        _personalTokenLock[_who] = false;
    }

    function PersonalTokenLockUp(address _who) onlyOwner public{
        require(_personalTokenLock[_who] == true);
        _personalTokenLock[_who] = true;
    }
}
