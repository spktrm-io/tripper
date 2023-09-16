import { View, Text, StatusBar } from "react-native";
import React from "react";
import styled from "styled-components";
import MapView from "react-native-maps";

const Container = styled(View)`
  flex: 1;
`;

const Home = () => {
  return (
    <Container>
      <MapView
        style={{ flex: 1 }}
        initialRegion={{
          latitude: 37.78825, // Latitude inicial
          longitude: -122.4324, // Longitude inicial
          latitudeDelta: 0.0922,
          longitudeDelta: 0.0421,
        }}
      >
        {/* Adicione marcadores, polígonos, linhas, etc., conforme necessário */}
      </MapView>
      {/* <StatusBar barStyle="dark-content" /> */}
    </Container>
  );
};

export default Home;
