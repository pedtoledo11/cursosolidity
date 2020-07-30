pragma solidity 0.6.10;
/*
SPDX-License-Identifier: CC-BY-4.0
(c) Desenvolvido por Pedro Toledo
This work is licensed under a Creative Commons Attribution 4.0 International License.
*/

contract alienacaoSocietaria {
    address payable public advogado;
    string public nomeDaSociedade;
    uint256 public capitalSocial;
    uint256 public numeroDeAcoes;
    uint256 public valorDaAcao;

    acionista[] public listaDeAcionistas;
    alienacao[] public listaDeAlienacoes;

    struct acionista {
        string nomeAcionista;
        uint256 cpfAcionista;
        address payable acionistaWallet;
        uint256 numeroDeAcoes;
    }

    struct alienacao {
        address payable vendedorWallet;
        address payable compradorWallet;
        uint256 quantidadeDeAcoes;
        uint256 prazoParaAOperacao;
        uint256 valorDaOperacao;
        uint256 dataDaOperacao;
    }

    constructor (string memory _nomeDaSociedade, uint256 _capitalSocial, uint256 _numeroDeAcoes, uint256 _valorDaAcao) public {
        advogado =  msg.sender;
        nomeDaSociedade = _nomeDaSociedade;
        capitalSocial = _capitalSocial;
        numeroDeAcoes = _numeroDeAcoes;
        valorDaAcao = _valorDaAcao;
    }

    function registrarAcionista(string memory _nome, uint256 _cpf, address payable _wallet, uint256 _numeroDeAcoes) public {
        require (msg.sender == advogado);
        listaDeAcionistas.push(acionista(_nome, _cpf, _wallet, _numeroDeAcoes));
    }

    function autorizarAlienacao(uint256 _paramVendedor, uint256 _paramComprador, uint256 _acoesAlienadas, uint256 _prazoParaAOperacao) public {
        require (msg.sender == listaDeAcionistas[_paramVendedor].acionistaWallet);
        require (_acoesAlienadas <= listaDeAcionistas[_paramVendedor].numeroDeAcoes);
        listaDeAlienacoes.push(alienacao(listaDeAcionistas[_paramVendedor].acionistaWallet, listaDeAcionistas[_paramComprador].acionistaWallet, _acoesAlienadas, _acoesAlienadas*numeroDeAcoes, _prazoParaAOperacao, 0 ));
    }
}
