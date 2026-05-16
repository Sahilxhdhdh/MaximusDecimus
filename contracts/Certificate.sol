// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CertificateVerification {

    struct Certificate {

        uint certificateId;
        string studentName;
        string courseName;
        address issuer;
        bool valid;
    }

    mapping(uint => Certificate) public certificates;

    function issueCertificate(
        uint _id,
        string memory _studentName,
        string memory _courseName
    ) public {

        certificates[_id] = Certificate(
            _id,
            _studentName,
            _courseName,
            msg.sender,
            true
        );
    }

    function verifyCertificate(uint _id)
    public
    view
    returns(
        uint,
        string memory,
        string memory,
        address,
        bool
    ) {

        Certificate memory c =
            certificates[_id];

        return (
            c.certificateId,
            c.studentName,
            c.courseName,
            c.issuer,
            c.valid
        );
    }
}