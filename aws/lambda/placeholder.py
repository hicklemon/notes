import logging
import os

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

def lambda_handler(event, context):

    logger.setLevel(logging.DEBUG)

    logger.debug("DEBUG: Lookup.GET")
    logger.error("ERROR: Lookup.GET")
    logger.info("INFO: Lookup.GET")
    logger.critical("CRITICAL: Lookup.GET")

