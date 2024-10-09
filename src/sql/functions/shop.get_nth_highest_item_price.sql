CREATE OR REPLACE FUNCTION shop.get_nth_highest_item_price(N INT)
RETURNS TABLE (Price DECIMAL(20, 2)) AS $$
BEGIN
  IF N <= 0 THEN
    RETURN QUERY SELECT NULL::DECIMAL(20, 2);
  ELSE
    RETURN QUERY (
      SELECT DISTINCT i.item_price
      FROM shop.item i
      ORDER BY i.item_price DESC
      OFFSET N-1 LIMIT 1
    );
  END IF;
END;
$$ LANGUAGE plpgsql;