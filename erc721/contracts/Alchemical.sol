// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./base64.sol";

contract AlchemicalSponsorTest is ERC721Enumerable, ReentrancyGuard, Ownable {
  string[] private elements = [unicode"🜀", unicode"🜁", unicode"🜂", unicode"🜃", unicode"🜄"];

  string[] private solvents = [unicode"🜅", unicode"🜆", unicode"🜇", unicode"🜈", unicode"🜉", unicode"🜊", unicode"🜋", unicode"🜌"];

  string[] private primes = [unicode"🜍", unicode"🜎", unicode"🜏", unicode"🜐", unicode"🜑", unicode"🜒", unicode"🜓", unicode"🜔", unicode"🜕", unicode"🜖", unicode"🜗", unicode"🜘", unicode"🜙"];

  string[] private ores = [
    unicode"🜚",
    unicode"🜛",
    unicode"🜜",
    unicode"🜝",
    unicode"🜞",
    unicode"🜟",
    unicode"🜠",
    unicode"🜡",
    unicode"🜢",
    unicode"🜣",
    unicode"🜤",
    unicode"🜥",
    unicode"🜦",
    unicode"🜧",
    unicode"🜨",
    unicode"🜩",
    unicode"🜪",
    unicode"🜫",
    unicode"🜬",
    unicode"🜭",
    unicode"🜮",
    unicode"🜯",
    unicode"🜰",
    unicode"🜱",
    unicode"🜲",
    unicode"🜳",
    unicode"🜴",
    unicode"🜵"
  ];

  string[] private process = [unicode"🝞", unicode"🝟", unicode"🝠", unicode"🝡", unicode"🝢", unicode"🝣", unicode"🝤"];

  string[] private aparatus = [unicode"🝥", unicode"🝦", unicode"🝧", unicode"🝨", unicode"🝩", unicode"🝪", unicode"🝫", unicode"🝬", unicode"🝭"];

  string[] private time = [unicode"🝮", unicode"🝯", unicode"🝰"];

  string[] private substances = [
    unicode"🜶",
    unicode"🜷",
    unicode"🜸",
    unicode"🜹",
    unicode"🜺",
    unicode"🜻",
    unicode"🜼",
    unicode"🜽",
    unicode"🜾",
    unicode"🜿",
    unicode"🝀",
    unicode"🝁",
    unicode"🝂",
    unicode"🝃",
    unicode"🝄",
    unicode"🝅",
    unicode"🝆",
    unicode"🝇",
    unicode"🝈",
    unicode"🝉",
    unicode"🝊",
    unicode"🝋",
    unicode"🝌",
    unicode"🝍",
    unicode"🝎",
    unicode"🝏",
    unicode"🝐",
    unicode"🝑",
    unicode"🝒",
    unicode"🝓",
    unicode"🝔",
    unicode"🝕",
    unicode"🝖",
    unicode"🝗",
    unicode"🝘",
    unicode"🝙",
    unicode"🝚",
    unicode"🝛",
    unicode"🝜",
    unicode"🝝"
  ];

  string[] private namePrefixes = ["Philter of", "Brew of", "Potion of", "Flask of", "Vial of", "Draught of", "Phial of", "Elixir of", "Tincture of", "Essence of", "Tonic of", "Poison of"];

  string[] private nameSuffixes = [
    "Accuracy",
    "Agility",
    "Amnesia",
    "Anger",
    "Apathy",
    "Arcane Enhancement",
    "Arcane Protection",
    "Aura Balancing",
    "Awakening",
    "Balance",
    "Beauty",
    "Berserker",
    "Blinding",
    "Bloodlust",
    "Brutality",
    "Camouflage",
    "Chaos",
    "Clairvoyance",
    "Comforting",
    "Concentration",
    "Deafening",
    "Death",
    "Deep Sleep",
    "Deliriousness",
    "Delusion",
    "Depression",
    "Desire",
    "Disabling",
    "Disease Curing",
    "Dmonic",
    "Domination",
    "Dream Inducement",
    "Dream Vision",
    "Dreamless Sleeping",
    "Dreamwalker",
    "Eagle Vision",
    "Ecstasy",
    "Empathy",
    "Empowerment",
    "Energy",
    "Enhanced Pain Relief",
    "Enhanced Reflexes",
    "Enhanced Senses",
    "Enhanced Sight",
    "Eternal Sleeping",
    "Excitement",
    "Farsight",
    "Feather Weight",
    "Fever",
    "Fire Protection",
    "Fire Resistance",
    "Fixation",
    "Flight",
    "Focus",
    "Foresight",
    "Forgetfulness",
    "Fortitude",
    "Fortune",
    "Free Will",
    "Frozen Blood",
    "Fury",
    "Ghost Sight",
    "Giant Growth",
    "Gills",
    "Growth",
    "Hallicination",
    "Happiness",
    "Harmony",
    "Haste",
    "Healing",
    "Health",
    "Hidden Talent",
    "Honesty",
    "Hunger",
    "Hysteria",
    "Idle Mind",
    "Immobilizing",
    "Immortality",
    "Immunity",
    "Incapacitating",
    "Increased Health",
    "Increased Immunity",
    "Insanity",
    "Insight",
    "Insomnia",
    "Intellect",
    "Intuition",
    "Invisibility",
    "Invulnerability",
    "Iron Skin",
    "Jealousy",
    "Joy",
    "Knowledge",
    "Light Feet",
    "Lightning Speed",
    "Love",
    "Lucid Dream",
    "Lunacy",
    "Lust",
    "Madness",
    "Manipulation",
    "Mind Alteration",
    "Mind Blanking",
    "Mind Control",
    "Mind Corrupting",
    "Mind Domination",
    "Mind Paralyzing",
    "Mind Restricting",
    "Mind Soothing",
    "Misfortune",
    "Night Vision",
    "Nightmare",
    "Nightmare Inducement",
    "Pain Relief",
    "Paralyzing",
    "Patience",
    "Perception",
    "Petrification",
    "Piece Of Mind",
    "Premonition",
    "Purification",
    "Rage",
    "Rejuvenation",
    "Restricting",
    "Revelation",
    "Reversed Growth",
    "Seduction",
    "Serenity",
    "Shrinking",
    "Silence",
    "Sleeping",
    "Slowing",
    "Strength",
    "Stunning",
    "Swiftness",
    "Tranquillity",
    "Transcendence",
    "Truth",
    "Vigor",
    "Vision",
    "Vision Inducement",
    "Vitality",
    "Wisdom",
    "Loot"
  ];

  function random(string memory input) internal pure returns (uint256) {
    return uint256(keccak256(abi.encodePacked(input)));
  }

  function getElement(uint256 tokenId) public view returns (string memory) {
    return pluck(tokenId, "ELEMENT", elements);
  }

  function getSolvent(uint256 tokenId) public view returns (string memory) {
    return pluck(tokenId, "SOLVENT", solvents);
  }

  function getPrime(uint256 tokenId) public view returns (string memory) {
    return pluck(tokenId, "PRIME", primes);
  }

  function getOre(uint256 tokenId) public view returns (string memory) {
    return pluck(tokenId, "ORE", ores);
  }

  function getProcess(uint256 tokenId) public view returns (string memory) {
    return pluck(tokenId, "PROCESS", process);
  }

  function getAparatus(uint256 tokenId) public view returns (string memory) {
    return pluck(tokenId, "APARATUS", aparatus);
  }

  function getTime(uint256 tokenId) public view returns (string memory) {
    return pluck(tokenId, "TIME", time);
  }

  function getSubstance(uint256 tokenId) public view returns (string memory) {
    return pluck(tokenId, "SUBSTANCE", substances);
  }

  function getPrefix(uint256 tokenId) public view returns (string memory) {
    return pluck(tokenId, "PREFIX", namePrefixes);
  }

  function getSuffix(uint256 tokenId) public view returns (string memory) {
    return pluck(tokenId, "SUFFIX", nameSuffixes);
  }

  function pluck(
    uint256 tokenId,
    string memory keyPrefix,
    string[] memory sourceArray
  ) internal pure returns (string memory) {
    uint256 rand = random(string(abi.encodePacked(keyPrefix, toString(tokenId))));
    string memory output = sourceArray[rand % sourceArray.length];
    output = string(abi.encodePacked(output));
    return output;
  }

  function tokenURI(uint256 tokenId) public view override returns (string memory) {
    string[21] memory parts;
    parts[0] = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350"><style>.base { fill: #3D3F44; font-family: serif; font-size: 14px; text-anchor: middle; }</style><rect width="100%" height="100%" fill="#FFF8E7" /><text x="50%" y="15%" class="base">';

    parts[1] = getElement(tokenId);

    parts[2] = '</text><text x="80%" y="45%" class="base">';

    parts[3] = getSolvent(tokenId);

    parts[4] = '</text><text x="20%" y="45%" class="base">';

    parts[5] = getPrime(tokenId);

    parts[6] = '</text><text x="65%" y="30%" class="base">';

    parts[7] = getOre(tokenId);

    parts[8] = '</text><text x="35%" y="30%" class="base">';

    parts[9] = getProcess(tokenId);

    parts[10] = '</text><text x="35%" y="60%" class="base">';

    parts[11] = getAparatus(tokenId);

    parts[12] = '</text><text x="65%" y="60%" class="base">';

    parts[13] = getTime(tokenId);

    parts[14] = '</text><text x="50%" y="75%" class="base">';

    parts[15] = getSubstance(tokenId);

    parts[16] = '</text><text x="50%" y="90%" class="base" text-anchor="middle">';

    parts[17] = getPrefix(tokenId);

    parts[18] = " ";

    parts[19] = getSuffix(tokenId);

    parts[20] = "</text></svg>";

    string memory output = string(abi.encodePacked(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5], parts[6], parts[7], parts[8]));
    output = string(abi.encodePacked(output, parts[9], parts[10], parts[11], parts[12], parts[13], parts[14], parts[15], parts[16]));
    output = string(abi.encodePacked(output, parts[17], parts[18], parts[19], parts[20]));

    string memory json = Base64.encode(bytes(string(abi.encodePacked('{"name": "Philtre #', toString(tokenId), '", "description": "Alchemical is an apothecary of sorts that purveys transferable philtres generated on chain at the time of transmutation. The results are random, the effect is unpredictable, and the rest is up to you.", "image": "data:image/svg+xml;base64,', Base64.encode(bytes(output)),'"}'))));
    output = string(abi.encodePacked("data:application/json;base64,", json));

    return output;
  }

  function claim(uint256 tokenId) public nonReentrant {
    require(tokenId > 0 && tokenId < 7778, "Token ID invalid");
    _safeMint(_msgSender(), tokenId);
  }

  function ownerClaim(uint256 tokenId) public nonReentrant onlyOwner {
    require(tokenId > 7777 && tokenId < 8001, "Token ID invalid");
    _safeMint(owner(), tokenId);
  }
  
  function sponsorClaim(uint256 tokenId) public nonReentrant  {
    require(tokenId > 8000 && tokenId < 8006, "Token ID invalid");
    _safeMint(0x429f42fB5247e3a34D88D978b7491d4b2BEe6105, tokenId);
  }

  function toString(uint256 value) internal pure returns (string memory) {
    // Inspired by OraclizeAPI's implementation - MIT license
    // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol

    if (value == 0) {
      return "0";
    }
    uint256 temp = value;
    uint256 digits;
    while (temp != 0) {
      digits++;
      temp /= 10;
    }
    bytes memory buffer = new bytes(digits);
    while (value != 0) {
      digits -= 1;
      buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
      value /= 10;
    }
    return string(buffer);
  }

  constructor() ERC721("AlchemicalSponsorTest", "ALCHEMICAL") Ownable() {}
}
