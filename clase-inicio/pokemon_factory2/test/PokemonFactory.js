const {expect} = require("chai");
const { ethers } = require("hardhat");

describe("Pokemon contract", function () {
    it("Pokemon Factory shouldn't has pokemons", async function () {
        // const [owner] = await ethers.getSigners(); // Esto es para crear un pokemon

        const PokemonFactory = await ethers.getContractFactory("PokemonFactory");

        const hardhatPokemon =  await PokemonFactory.deploy();

        const pokemons = await hardhatPokemon.getAllPokemons();

        expect(pokemons.length).to.equal(0);

    });    
});