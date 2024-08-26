import { View, Text, TouchableOpacity } from "react-native";
import React from "react";
import { styles } from "./CardItemBottomSheet.style";
import { ICardItemBottomSheetProps } from "../../../interfaces/BottomSheet/ICardItemBottomSheetProps";

const CardItemBottomSheet = ({ item }: { item: ICardItemBottomSheetProps }) => {
  return (
    <TouchableOpacity>
      <View style={styles.card}>
        <Text style={styles.title}>{item.name}</Text>
        <Text style={styles.subtitle}>{item.address}</Text>
      </View>
    </TouchableOpacity>
  );
};

export default CardItemBottomSheet;
