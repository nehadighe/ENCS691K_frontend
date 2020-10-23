import Api from "@/services/Api"

export const getAllItems = async (context) => {
    var result = await Api().get("/items/getAllItems");
    // console.log('line 5, actions- getAllItems', result);
    context.commit("getAllItems", result.data);
}


export const changeItemAvailability = (context, itemId) => {
    context.commit("changeItemAvailability", itemId)
}