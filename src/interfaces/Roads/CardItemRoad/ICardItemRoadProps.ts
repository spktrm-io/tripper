import { INavigation } from "../../Navigation/INavigation";
import { IItem } from "./IItem";

export interface ICardItemRoadProps extends INavigation {
  item: IItem;
}
