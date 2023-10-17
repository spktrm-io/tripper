import { StyleSheet, Text, TouchableOpacity, View } from "react-native";
import React from "react";
import { Image } from "expo-image";
import { ParamListBase, useNavigation } from "@react-navigation/native";
import { StackNavigationProp } from "@react-navigation/stack";

interface IItemSearchProps {
  id: string;
  name: string;
  address: string;
  source: any;
  description: string;
}

interface IRoadCardSearch {
  item: IItemSearchProps;
  navigation: StackNavigationProp<ParamListBase>;
}

const RoadCardSearch = ({ item, navigation }: IRoadCardSearch) => {
  return (
    <TouchableOpacity
      onPress={() =>
        navigation.navigate("RoadDetails", {
          id: item.id,
          name: item.name,
          address: item.address,
          source: item.source,
          description: item.description,
        })
      }
    >
      <View style={itemSearchStyles.card}>
        <Image
          source={item.source}
          style={{
            height: 200,
            width: "100%",
            borderRadius: 10,
            marginBottom: 10,
          }}
          priority="high"
        />
        <Text style={itemSearchStyles.title}>{item.name}</Text>
        <Text style={itemSearchStyles.subtitle}>{item.address}</Text>
      </View>
    </TouchableOpacity>
  );
};

export default RoadCardSearch;

const itemSearchStyles = StyleSheet.create({
  card: {
    borderRadius: 10,
    borderWidth: 2,
    borderColor: "rgb(236, 236, 236)",
    marginHorizontal: 10,
    alignItems: "flex-start",
    justifyContent: "center",
    padding: 15,
    marginBottom: 10,
    gap: 5,
  },
  title: { fontSize: 20, fontWeight: "900" },
  subtitle: { fontSize: 17, fontWeight: "300" },
});
