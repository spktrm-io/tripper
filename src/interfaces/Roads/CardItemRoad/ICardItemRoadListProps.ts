import { INavigation } from "../../Navigation/INavigation";
import { IItem } from "./IItem";

export interface ICardItemRoadListProps extends INavigation {
  item: IItem;
}
