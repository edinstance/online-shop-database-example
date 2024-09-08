CREATE OR REPLACE FUNCTION shop.rank_item_quantity()
RETURNS TABLE (rank INT, item_quantity INT) AS $$
BEGIN
    RETURN QUERY
    SELECT
        CAST(dense_rank() OVER (ORDER BY i.item_quantity DESC) AS INT )AS rank,
        i.item_quantity
    FROM shop.item i;
END;
$$ LANGUAGE plpgsql;