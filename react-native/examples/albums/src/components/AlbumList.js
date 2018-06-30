import React, { Component } from 'react';
import { View } from 'react-native';
import AlbumDetail from './AlbumDetail';

class AlbumList extends Component {
    state = { albums: [] };

    componentWillMount() {
        console.log('Inside componentWillMount in AlbumList');
        fetch('https://rallycoding.herokuapp.com/api/music_albums')
        .then((response) => response.json())
        .then((responseJson) => {
            this.setState({ albums: responseJson });
        });
    }

    renderAlbums() {
        return this.state.albums.map(item =>
            <AlbumDetail key={item.title} album={item} />
        );
    }

    render() {
        console.log('albums state refactored: ', this.state.albums);
        return (
            <View>
                {this.renderAlbums()}
            </View>
        );
    }
}

export default AlbumList;
