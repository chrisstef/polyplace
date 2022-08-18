/** @type {import('next').NextConfig} */

const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  images: {
    domains: ['polyplacedapp.infura-ipfs.io'],
  },
};

module.exports = nextConfig;
