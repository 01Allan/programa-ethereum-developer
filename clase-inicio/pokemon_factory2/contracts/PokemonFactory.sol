// SPDX-License-Identifier: GPL- 3.0

pragma solidity >= 0.7.0 < 0.9.0;

contract PokemonFactory {
    struct Pokemon {
        uint id;
        string name;
    }

    // El objetivo de programar en solidity es ocupar el menor espacio de memoria posible. 

    Pokemon[] private pokemons; // variable global privada 

    // mapping: va a mapear address a un entero y viceversa, ya que se almacena en una direccion de memoria
    mapping (uint => address) public pokemonToOwner; // dueno del pokemon
    mapping (address => uint) ownerPokemonCount; // la cantidad de pokemons que tiene el due;o


    // memory: indica a solidity que la variable solo va a existir mientras se ejecute la funcion
    function createPokemon (string memory _name, uint _id) public {
        pokemons.push(Pokemon(_id, _name)); // agrega el pokemon al array
        // msg.sender: identifica quien ejecuta el contrato. 
        pokemonToOwner[_id] = msg.sender; // se le asigna la id del pokemon al owner en particular. 
        ownerPokemonCount[msg.sender]++; 
    }

    // view: no se actualiza el contrato, no se hacen ciertas validaciones. y el retorno es mas rápido.
    function getAllPokemons() public view returns (Pokemon[] memory) {
        return pokemons;
    }

    /* function getResult() public pure returns (uint product, uint sum) {
        uint a = 1;
        uint b = 2;
        product = a * b;
        sum = a + b;
    }
    */

}
