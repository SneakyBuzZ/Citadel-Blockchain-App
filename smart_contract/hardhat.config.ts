import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-ignition";

import * as dotenv from "dotenv";

dotenv.config();

const config: HardhatUserConfig = {
  solidity: "0.8.24",
  networks: {
    sepolia: {
      url: process.env.URL,
      accounts: [process.env.PRIVATE_KEY!],
    },
  },
};

export default config;
