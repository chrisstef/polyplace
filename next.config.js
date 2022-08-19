/** @type {import('next').NextConfig} */

const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  images: {
    domains: ['polyplace.infura-ipfs.io'],
  },
};

module.exports = nextConfig;
