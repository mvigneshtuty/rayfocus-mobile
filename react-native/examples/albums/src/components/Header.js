import React from 'react';
import { Text, View } from 'react-native';

// Create component
const Header = (props) => {
  const { textStyle, viewStyle } = styles;
      return (
        <View style={viewStyle}>        
          <Text style={textStyle}>
            {props.headerText}
          </Text>
        </View>
      );
  };

// Stylings
const styles = {
  viewStyle: {
    backgroundColor: '#F8F8F8',
    justifyContent: 'center',
    alignItems: 'center',
    height: 60,
    paddingTop: 20,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.2,
    elevation: 2,
    position: 'relative'
  },
  textStyle: {
    fontSize: 25
  }
};

// Export the component
export default Header;
