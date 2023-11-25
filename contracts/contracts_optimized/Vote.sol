// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.15;

contract OptimizedVote {
    struct Voter {
        uint8 vote;
        bool voted;
    }

    struct Proposal {  //? Rearrange struct to only utilize 2 slot at most
        uint8 voteCount;
        bool ended;
        bytes32 name;
    }

    mapping(address => Voter) public voters;

    Proposal[] proposals;

    function createProposal(bytes32 _name) external {
        proposals.push(Proposal({voteCount: 0, name: _name, ended: false}));
    }

    function vote(uint8 _proposal) external {
        require(!voters[msg.sender].voted, 'already voted');
        voters[msg.sender].vote = _proposal;
        voters[msg.sender].voted = true;
        unchecked { //? used unchecked to optimize gas cost since no need to check for underflow/overflow
            proposals[_proposal].voteCount++; //? used ++ instead of += 1
        }
    }

    function getVoteCount(uint8 _proposal) external view returns (uint8) {
        return proposals[_proposal].voteCount;
    }
}
