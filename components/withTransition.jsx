import { motion } from 'framer-motion';

export default function withTransition(Component) {
  return (props) => (
    <motion.div
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      transition={{ duration: 0.3, ease: 'easeInOut' }}
      // animate={{ width: '100%' }}
      // exit={{ transition: { duration: 1 } }}

    >
      <Component {...props} />
    </motion.div>
  );
}
