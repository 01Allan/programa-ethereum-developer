// SPDX-License-Identifier: GPL- 3.0

pragma solidity >= 0.7.0 < 0.9.0;

contract PokemonFactory {
    struct Pokemon {
        uint id;
        string name;
    }


    // El objetivo de programar en solidity es ocupar el menor espacio de memoria posible. 

    Pokemon[] private pokemon; // variable global privada 

    // mapping: va a mapear address a un entero y viceversa, ya que se almacena en una direccion de memoria
    mapping (uint => address) public pokemonToOwner; // dueno del pokemon
    mapping (address => uint) ownerPokemonCount; // la cantidad de pokemons que tiene el due;o


    // memory: indica a solidity que la variable solo va a existir mientras se ejecute la funcion
    function createPokemon (string memory _name, uint _id) public {
        pokemon.push(Pokemon(_id, _name));
        pokemonToOwner[_id] = msg.sender;
        ownerPokemonCount[msg.sender]++;
    }

    function getAllPokemons() public view returns (Pokemon[] memory) {
        return pokemon;
    }

    function getResult() public pure returns (uint product, uint sum) {
        uint a = 1;
        uint b = 2;
        product = a * b;
        sum = a + b;
    }

}