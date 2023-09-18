import { View, Text, StyleSheet, TouchableOpacity } from "react-native";
import React from "react";

interface IItemSearchProps {
  name: string;
  address: string;
}

const itemSearchStyles = StyleSheet.create({
  card: {
    borderRadius: 10,
    borderWidth: 2,
    borderColor: "rgb(236, 236, 236)",
    marginHorizontal: 10,
    height: 70,
    alignItems: "flex-start",
    justifyContent: "center",
    paddingHorizontal: 15,
    marginBottom: 10,
    gap: 5,
  },
  title: { fontSize: 20, fontWeight: "900" },
  subtitle: { fontSize: 17, fontWeight: "300" },
});

const ItemSearch = ({ name, address }: IItemSearchProps) => {
  return (
    <TouchableOpacity>
      <View style={itemSearchStyles.card}>
        <Text style={itemSearchStyles.title}>{name}</Text>
        <Text style={itemSearchStyles.subtitle}>{address}</Text>
      </View>
    </TouchableOpacity>
  );
};

export default ItemSearch;
