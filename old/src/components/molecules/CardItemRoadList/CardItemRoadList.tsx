import { Text, TouchableOpacity, View } from "react-native";
import React from "react";
import { Image } from "expo-image";
import { styles } from "./CardItemRoadList.style";
import { ICardItemRoadListProps } from "../../../interfaces/Roads/CardItemRoad/ICardItemRoadListProps";

const CardItemRoadList = ({ item, navigation }: ICardItemRoadListProps) => {
  const routeParams = {
    id: item.id,
    name: item.name,
    address: item.address,
    source: item.source,
    description: item.description,
  };

  return (
    <TouchableOpacity
      onPress={() => navigation.navigate("RoadDetails", routeParams)}
    >
      <View style={styles.card}>
        <Image source={item.source} style={styles.image} priority="high" />
        <Text style={styles.title}>{item.name}</Text>
        <Text style={styles.subtitle}>{item.address}</Text>
      </View>
    </TouchableOpacity>
  );
};

export default CardItemRoadList;
