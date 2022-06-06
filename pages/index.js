import { Banner } from '../components';

const Home = () => (
  <div className="flex justify-center sm:px-4 p-12">
    <div className="w-full minmd:w-4/5">
      <Banner
        name="Discover, collect, and trade extraordinary NFTs"
        childStyles="md:text-4xl sm:text-2xl xs:text-xl text-center"
        parentStyles="justify-start mb-6 h-72 sm:h-60 p-12 xs:p-4 xs:h-44 rounded-3xl"

      />
    </div>

  </div>
);

export default Home;
