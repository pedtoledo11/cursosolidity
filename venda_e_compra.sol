// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.10;

contract vendaECompra
{
    string public vendedor;
    string public comprador;
    uint256 private valor;
    uint256 constant comissao = 10;
    
    constructor (
        string memory paramvendedor,
        string memory paramcomprador,
        uint256 valorDoImovel
        )
    public
    {
        vendedor = paramvendedor;
        comprador = paramcomprador;
        valor = valorDoImovel;
    }  
    
    function valorDoImovel() public view returns (uint256) {
        return valor;
    }

    function comissaoAVista(uint256 percentualComissao) public
    {
        if (percentualComissao > 8)
        {
            percentualComissao = 8;
        }
        uint256 valorComissaoAVista;
        valorComissaoAVista = ((valor*percentualComissao)/100);
        valor = valor + valorComissaoAVista;
    }
    
    function comissaoAPrazo (uint256 percentualComissao2) public
    {
        if (percentualComissao2 > 9)
        {
            percentualComissao2 = 9;
        }
        uint256 valorComissaoAPrazo;
        valorComissaoAPrazo = ((valor*percentualComissao2)/100);
        valor = valor + valorComissaoAPrazo;
    }
}
