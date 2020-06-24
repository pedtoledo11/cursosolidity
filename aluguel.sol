// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.10;

contract Aluguel
{
    string public locador;
    string public locatario;
    uint256 private valor;
    uint256 constant numeroMaximoLegaldeAlugueisParaMulta = 3;
    
    constructor (
        string memory paramlocador,
        string memory paramlocatario,
        uint256 valorDoAluguel
        )
    public
    {
        locador = paramlocador;
        locatario = paramlocatario;
        valor = valorDoAluguel;
    }  
    
    function valorDoAluguel() public view returns (uint256) {
        return valor;
    }
}
