/**
 * React Native Root Component
 *
 */

import React from 'react';
import { View } from 'react-native';
import Header from './src/components/Header';
import AlbumList from './src/components/AlbumList';

const App = () => {
    return (
      <View>
        <Header headerText={'Albums App'} />
        <AlbumList />
      </View>
    );
  };

export default App;
